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
}
?>