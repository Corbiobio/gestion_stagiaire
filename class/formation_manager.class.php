<?php
class Formation_manager
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

    public function insert_foramtion($obj)
    {
        $sql = "INSERT INTO enseigner (ID_FORMATEUR, ID_STAGIERE, DATE_DEBUT, DATE_FIN)
        VALUES (:id_formateur, :id_stagiaire, :date_start, :date_end);";

        $result = $this->getC()->prepare($sql);

        $id_formateur = $obj->getId_formateur();
        $id_stagiaire = $obj->getId_stagiaire();
        $date_start = $obj->getDate_start();
        $date_end = $obj->getDate_end();

        $result->bindParam(':id_formateur', $id_formateur);
        $result->bindParam(':id_stagiaire', $id_stagiaire);
        $result->bindParam(':date_start', $date_start);
        $result->bindParam(':date_end', $date_end);

        $result->execute();
    }

    public function get_all_formation()
    {
        $sql = "SELECT * FROM enseigner";
        $result = $this->getC()->query($sql);

        $arr = array();

        while ($line = $result->fetch()) {
            $formation = new Formation();

            $formation->setDate_end($line["DATE_FIN"]);
            $formation->setDate_start($line["DATE_DEBUT"]);
            $formation->setId_formateur($line["ID_FORMATEUR"]);
            $formation->setId_stagiaire($line["ID_STAGIERE"]);

            array_push($arr, $formation);
        }

        return $arr;
    }

    public function delete_formation_with_id_students($id)
    {
        $sql = "DELETE FROM enseigner WHERE ID_STAGIERE = :id";
        $result = $this->getC()->prepare($sql);

        $result->bindParam(":id", $id);

        $result->execute();
    }
}
?>