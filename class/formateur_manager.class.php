<?php
class Formateur_manager
{
    private object $c;

    public function __construct($c)
    {
        $this->c = $c;
    }
    public function setC($c)
    {
        $this->c = $c;
    }
    public function getC()
    {
        return $this->c;
    }

    public function getAll_type_formation()
    {
        $sql = "SELECT * FROM `type_formation`";
        $result = $this->getC()->query($sql);

        $arr = array();

        while ($line = $result->fetch()) {
            array_push($arr, $line["NOM_FORMATION"]);
        }

        return $arr;
    }

    public function select_all_formateur()
    {
        $sql_1 = "SELECT formateur.ID_SALLE, ID_FORMATEUR, salle_formation.NOM_SALLE AS salle, NOM_FORMATEUR FROM `formateur`
        JOIN salle_formation ON formateur.ID_SALLE = salle_formation.ID_SALLE";

        $result = $this->getC()->query($sql_1);

        $arr = array();

        //if fetch result
        while ($line = $result->fetch()) {
            $formateur = new Formateur();

            $formateur->setId_formateur($line["ID_FORMATEUR"]);
            $formateur->setNom_salle($line["salle"]);
            $formateur->setId_salle($line["ID_SALLE"]);
            $formateur->setNom_formateur($line["NOM_FORMATEUR"]);
            array_push($arr, $formateur);

            //get all formation
            $sql_2 = "SELECT type_formation.NOM_FORMATION FROM `former` JOIN type_formation ON former.ID_FORMATION = type_formation.ID_FORMATION WHERE ID_FORMATEUR = :id_formateur";

            $id_formateur = $formateur->getId_formateur();

            $result_2 = $this->getC()->prepare($sql_2);
            $result_2->bindParam(":id_formateur", $id_formateur);
            $result_2->execute();

            $arr_2 = array();
            while ($line_2 = $result_2->fetch()) {
                array_push($arr_2, $line_2["NOM_FORMATION"]);
            }
            $formateur->setFormation($arr_2);
        }

        return $arr;
    }

    public function formateur_to_arr($obj)
    {
        $arr = array();

        if ($obj->getId_formateur()) {
            $arr["id_formateur"] = $obj->getId_formateur();
        }
        if ($obj->getFormation()) {
            $arr["formation"] = $obj->getFormation();
        }
        if ($obj->getId_salle()) {
            $arr["id_salle"] = $obj->getId_salle();
        }
        if ($obj->getNom_salle()) {
            $arr["nom_salle"] = $obj->getNom_salle();
        }
        if ($obj->getNom_formateur()) {
            $arr["nom_formateur"] = $obj->getNom_formateur();
        }
        return $arr;
    }



    // public function select_one_formateur($id_formateur)
    // {
    //     $sql = "SELECT * FROM `formateur` WHERE ID_FORMATEUR = :id_formateur";
    //     $result = $this->getC()->prepare($sql);

    //     $result->bindParam(":id_formateur", $id_formateur);

    //     $result->execute();

    //     $formateur = new Formateur();
    //     $line = $result->fetch();

    //     //if fetch result
    //     if ($line) {
    //         $formateur->setId_formateur($line["ID_FORMATEUR"]);
    //         $formateur->setId_formation($line["ID_SALLE"]);
    //         $formateur->setId_salle($line["ID_FORMRATION"]);
    //         $formateur->setNom_formateur($line["NOM_FORMATEUR"]);

    //         return $formateur;
    //     } else {
    //         return false;
    //     }

    // }
}
?>