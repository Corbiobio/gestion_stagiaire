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

//on post
if (isset($_POST["stagiaire"])) {
    foreach ($_POST["stagiaire"] as $key => $id_stagiaire) {
        $formation_manager->delete_formation_with_id_students($id_stagiaire);
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
            <td>Suppression</td>
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
                $arr["formation"][0]["nom_salle"] = $formateur["NOM_SALLE"];
                $arr["formation"][0]["date_start"] = $obj->getDate_start();
                $arr["formation"][0]["date_end"] = $obj->getDate_end();

                $arr_formation[$stagiaire["ID_STAGIAIRE"]] = $arr;

            } else {
                //put info of second formateur
                array_push($arr_formation[$stagiaire["ID_STAGIAIRE"]]["formation"], array());
                $arr_formation[$stagiaire["ID_STAGIAIRE"]]["formation"][1]["nom_formateur"] = $formateur["NOM_FORMATEUR"];
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
            <td>$name</td>
            <td>$last_name</td>
            <td>$nationality</td>
            <td>$formation</td>
            <td>");

            //display each formation
            for ($i = 0; $i < count($obj["formation"]); $i++) {
                $formation = $obj["formation"][$i];
                $formateur = $formation["nom_formateur"];
                $nom_salle = $formation["nom_salle"];
                $date_start = $formation["date_start"];
                $date_end = $formation["date_end"];

                echo ("$formateur | $nom_salle | $date_start | $date_end <br>");
            }

            echo ("
            </td>
            <td>
                <input type=checkbox name=stagiaire[] value=$id_stagiaire id=$id_stagiaire><label for=$id_stagiaire >delete</label>
            </td>
        </tr>
        ");
        }
        ?>

    </table>
    <input type="submit">
</form>

<hr>
<nav><a href=modif.php>modif</a><a href=insert.php>insert</a></nav>
<hr>

<style>
    <?php include "style.css"; ?>
</style>