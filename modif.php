<?php
include "base.php";
include "class/formation_manager.class.php";
include "class/formation.class.php";
include "class/stagiaire_manager.class.php";
include "class/stagiaire.class.php";
include "class/formateur_manager.class.php";
include "class/formateur.class.php";

$formation_manager = new Formation_manager($base);
$formateur_manager = new Formateur_manager($base);
$stagiaire_manager = new Stagiaire_manager($base);

// var_dump($_POST);

if (isset($_POST["stagiaire_modif"])) {

    //foreach stagiaire checked
    foreach ($_POST["stagiaire_modif"] as $id_stagiaire => $value) {

        $stagiaire = new Stagiaire();

        $stagiaire->setId_stagiaire($id_stagiaire);
        $stagiaire->setPrenom_stagiaire($_POST["name"][$id_stagiaire]);
        $stagiaire->setNom_stagiaire($_POST["last_name"][$id_stagiaire]);
        $stagiaire->setId_nationaliter($_POST["nationality"][$id_stagiaire]);
        $stagiaire->setId_formation($_POST["formation"][$id_stagiaire]);

        $stagiaire_manager->update_stagiaire($stagiaire);

        //if formateur checked
        if (isset($_POST["formateur"][$id_stagiaire])) {
            $formateur = $_POST["formateur"][$id_stagiaire];

            $formation_manager->delete_formation_with_id_students($id_stagiaire);

            foreach ($formateur as $id_formateur => $name_formateur) {

                $obj_formation = new Formation();
                $obj_formation->setId_stagiaire($id_stagiaire);
                $obj_formation->setId_formateur($id_formateur);
                $obj_formation->setDate_start($_POST["start"][$id_stagiaire][$id_formateur]);
                $obj_formation->setDate_end($_POST["end"][$id_stagiaire][$id_formateur]);

                $formation_manager->insert_foramtion($obj_formation);
            }
        }
    }
}


?>
<form method=post>

    <table>

        <tr>
            <td>Prenom</td>
            <td>Nom</td>
            <td>Nationalite</td>
            <td>Formation</td>
            <td>Formateur - Salle - Debut - Fin</td>
            <td>modifier</td>
        </tr>

        <?php
        $all_formation = $formation_manager->get_all_formation();

        $arr_formation = array();

        foreach ($all_formation as $key => $obj) {
            $stagiaire = $stagiaire_manager->getOne_stagiaire($obj->getId_stagiaire());
            $formateur = $formateur_manager->getOne_formateur($obj->getId_formateur());

            //make one arr by stagiaire
            if (!isset($arr_formation[$stagiaire["ID_STAGIAIRE"]])) {

                $arr = array();

                $arr["name"] = $stagiaire["PRENOM_STAGIERE"];
                $arr["last_name"] = $stagiaire["NOM_STAGIERE"];
                $arr["nationality"] = $stagiaire["LABELLE_NATIONALITER"];
                $arr["name_formation"] = $stagiaire["nom_formation"];

                $arr["formation"] = array();

                $arr["formation"][0]["nom_formateur"] = $formateur["NOM_FORMATEUR"];
                $arr["formation"][0]["id_formateur"] = $obj->getId_formateur();
                $arr["formation"][0]["nom_salle"] = $formateur["NOM_SALLE"];
                $arr["formation"][0]["date_start"] = $obj->getDate_start();
                $arr["formation"][0]["date_end"] = $obj->getDate_end();

                $arr_formation[$stagiaire["ID_STAGIAIRE"]] = $arr;

            } else {
                //put info of second formateur
                array_push($arr_formation[$stagiaire["ID_STAGIAIRE"]]["formation"], array());
                $arr_formation[$stagiaire["ID_STAGIAIRE"]]["formation"][1]["nom_formateur"] = $formateur["NOM_FORMATEUR"];
                $arr_formation[$stagiaire["ID_STAGIAIRE"]]["formation"][1]["id_formateur"] = $obj->getId_formateur();
                $arr_formation[$stagiaire["ID_STAGIAIRE"]]["formation"][1]["nom_salle"] = $formateur["NOM_SALLE"];
                $arr_formation[$stagiaire["ID_STAGIAIRE"]]["formation"][1]["date_start"] = $obj->getDate_start();
                $arr_formation[$stagiaire["ID_STAGIAIRE"]]["formation"][1]["date_end"] = $obj->getDate_end();
            }
        }


        //create each tr
        foreach ($arr_formation as $id_stagiaire => $obj) {

            $name = $obj["name"];
            $last_name = $obj["last_name"];
            $nationality = $obj["nationality"];
            $formation = $obj["name_formation"];

            echo ("
            <tr>
                <td><input type=text value=$name name=name[$id_stagiaire] required></td>
                <td><input type=text value=$last_name name=last_name[$id_stagiaire] required> </td>
            ");

            //create select nationality
            $all_nationality = $stagiaire_manager->getAll_nationality();
            echo ("
                <td>
                    <select name=nationality[$id_stagiaire]>
            ");

            foreach ($all_nationality as $id_nationality => $name_nationality) {
                //selected the good option
                if ($name_nationality === $nationality) {
                    echo "<option value=$id_nationality selected>$name_nationality</option>";
                } else {
                    echo "<option value=$id_nationality>$name_nationality</option>";
                }
            }
            echo ("
                </select>
            </td>");

            //create select formation
            $all_formation = $stagiaire_manager->getAll_type_formation();

            echo ("
            <td>
                <select name=formation[$id_stagiaire]>
            ");
            foreach ($all_formation as $id_formation => $name_formation) {
                if ($name_formation === $formation) {
                    echo "<option value=$id_formation selected>$name_formation</option>";
                } else {
                    echo "<option value=$id_formation>$name_formation</option>";
                }
            }
            echo ("
            </select>
            </td>
            ");

            //display each formation
            echo ("<td>");
            $all_formateur = $formateur_manager->select_all_formateur();

            // var_dump($obj["formation"][0]["id_formateur"]);
        
            $curr_formation = $obj["formation"];
            foreach ($all_formateur as $i => $obj) {


                $name_formateur = $obj->getNom_formateur();
                $id_formateur = $obj->getId_formateur();
                $nom_salle = $obj->getNom_salle();

                //test if a formateur alredy exist
                $already_exist = false;
                $index_exist = 0;
                for ($index_exist; $index_exist < count($curr_formation); $index_exist++) {
                    if (in_array($obj->getId_formateur(), $curr_formation[$index_exist])) {
                        $already_exist = true;
                        break;
                    }
                }

                if ($already_exist) {
                    $date_start = $curr_formation[$index_exist]["date_start"];
                    $date_end = $curr_formation[$index_exist]["date_end"];
                } else {
                    $date_start = date("Y-m-d");
                    $date_end = date("Y-m-d");
                }
                $date_curr = date("Y-m-d");

                $id_input_formateur = "formateur_" . $id_stagiaire . "_" . $id_formateur;
                echo ("
                <input type=checkbox name=formateur[$id_stagiaire][$id_formateur] value=$name_formateur id=$id_input_formateur>
                <label for=$id_input_formateur >$name_formateur</label>
                - $nom_salle -
                <input type=date value=$date_start min=$date_curr name=start[$id_stagiaire][$id_formateur]>
                <input type=date value=$date_end min=$date_curr name=end[$id_stagiaire][$id_formateur]>
                <br>
                ");
            }
            echo ("
                </td>
                <td>
                    <input type=checkbox name=stagiaire_modif[$id_stagiaire] value=$id_stagiaire id=$id_stagiaire><label for=$id_stagiaire >modifier</label>
                </td>
            </tr>
            ");


        }

        ?>

    </table>
    <input type="submit">
</form>




<hr>
<nav><a href=delete.php>delete</a><a href=insert.php>insert</a></nav>
<hr>
<style>
    <?php include "style.css"; ?>
</style>

<!-- <script>
    <?php
    //arr of obj to arr of arr
    $formateur_arr = array();
    foreach ($all_formateur as $key => $obj) {
        array_push($formateur_arr, $formateur_manager->formateur_to_arr($obj));
    }
    ?>

    let all_formateur = <?= json_encode($formateur_arr) ?>;
    console.log(all_formateur);

    let formation = document.getElementById("formation")

    //execute on page load
    formation_disable(formation.value)

    formation.addEventListener("change", (e) => {
        //get current formation
        let current_formation = e.target.value

        formation_disable(current_formation)
    })

    function formation_disable(formation) {
        for (let i = 0; i < all_formateur.length; i++) {
            let formateur = all_formateur[i]
            //get input for each formateur
            let input = document.getElementById(formateur.id_formateur)

            //if formateur have formation 
            if (formateur.formation.includes(formation)) {
                input.removeAttribute("disabled")
            } else {
                input.setAttribute("disabled", true)
            }
        }
    }

</script> -->