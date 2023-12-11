<?php
include "class/stagiaire_manager.class.php";
include "class/stagiaire.class.php";
include "class/formateur_manager.class.php";
include "class/formateur.class.php";
include "class/formation_manager.class.php";
include "class/formation.class.php";
include "base.php";

$formation_manager = new Formation_manager($base);
$stagiaire_manager = new Stagiaire_manager($base);
$formateur_manager = new Formateur_manager($base);


?>

<form action=# method=post>
    <div>
        <label for="name">name :</label>
        <input type="text" name=name id=name placeholder=name required>
    </div>
    <div>
        <label for="last_name">last_name :</label>
        <input type="text" name=last_name id=last_name placeholder=last_name required>
    </div>
    <div>
        <label for="nationality">nationality :</label>
        <select name=nationality id=nationality>
            <!-- php -->
            <?php

            $nationality = $stagiaire_manager->getAll_nationality();

            var_dump($nationality);
            foreach ($nationality as $key => $value) {
                echo "<option value=$key>$value</option>";
            }

            ?>

        </select>
    </div>

    <div>
        <label for="formation">formation :</label>
        <select name=formation id=formation>
            <!-- php -->
            <?php

            $type_formation = $stagiaire_manager->getAll_type_formation();

            foreach ($type_formation as $key => $value) {
                echo "<option value=$key>$value</option>";
            }

            ?>
        </select>
    </div>

    <div class=check_box>
        <?php
        $all_formateur = $formateur_manager->select_all_formateur();
        foreach ($all_formateur as $key => $value) {

            $nom = $value->getNom_formateur();
            $salle = $value->getNom_salle();
            // $formation = $value->getNom_formation();
            $id_formateur = $value->getId_formateur();

            $current_date = date("Y-m-d");

            echo "<div>
                <input type=checkbox name=formateur[$id_formateur] id=$nom value=$nom><label for=$nom>$nom dans la salle : $salle</label>
                <label for=start_$id_formateur>debut : </label> <input type=date value=$current_date min=$current_date name=start[$id_formateur] id=start_$id_formateur>
                <label for=end_$id_formateur>, fin : </label> <input type=date value=$current_date min=$current_date name=end[$id_formateur] id=end_$id_formateur>
            </div>";
        }

        ?>
    </div>

    <div>
        <input type="submit">
    </div>

</form>

<?php
//if form submit
if (isset($_POST["name"]) && isset($_POST["last_name"]) && isset($_POST["nationality"]) && isset($_POST["formation"])) {

    $stagiaire = new Stagiaire();

    $stagiaire->setPrenom_stagiaire($_POST["name"]);
    $stagiaire->setNom_stagiaire($_POST["last_name"]);
    $stagiaire->setId_nationaliter($_POST["nationality"]);
    $stagiaire->setId_formation($_POST["formation"]);
    $stagiaire->setId_stagiaire(uniqid());

    $stagiaire_manager->insert_stagiaire($stagiaire);

    if (isset($_POST["formateur"])) {
        foreach ($_POST["formateur"] as $id_formateur => $name_formateur) {

            $formation = new Formation();
            $formation->setId_formateur($id_formateur);
            $formation->setId_stagiaire($stagiaire->getId_stagiaire());
            $formation->setDate_start($_POST["start"][$id_formateur]);
            $formation->setDate_end($_POST["end"][$id_formateur]);

            $formation_manager->insert_foramtion($formation);
        }
    }

}
?>

<hr>
<nav><a href=modif.php>modif</a><a href=delete.php>delete</a></nav>
<hr>
<style>
    <?php include "style.css"; ?>
</style>
<script>
    <?php
    //arr of obj to arr of arr
    $formateur_arr = array();
    foreach ($all_formateur as $key => $obj) {
        array_push($formateur_arr, $formateur_manager->formateur_to_arr($obj));
    }

    ?>
    let all_formateur = <?= json_encode($formateur_arr) ?>;
    console.log(all_formateur);


</script>