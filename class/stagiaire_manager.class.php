<?php
class Stagiaire_manager
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

    public function getAll_nationality()
    {
        $sql = "SELECT * FROM `nationaliter`";
        $result = $this->getC()->query($sql);

        $arr = array();

        while ($line = $result->fetch()) {
            $arr[$line["ID_NATIONALITER"]] = $line["LABELLE_NATIONALITER"];
        }

        return $arr;
    }
    public function getAll_type_formation()
    {
        $sql = "SELECT * FROM `type_formation`";
        $result = $this->getC()->query($sql);

        $arr = array();

        while ($line = $result->fetch()) {
            $arr[$line["ID_FORMATION"]] = $line["NOM_FORMATION"];
        }
        return $arr;
    }
    public function insert_stagiaire($obj)
    {
        $sql = "INSERT INTO stagiaire (ID_STAGIAIRE, ID_FORMRATION, ID_NATIONALITER, NOM_STAGIERE, PRENOM_STAGIERE) 
        VALUES (:id_stagiaire, :id_formation, :id_nationaliter, :nom, :prenom);";

        $result = $this->getC()->prepare($sql);

        $id_stagiaire = $obj->getId_stagiaire();
        $id_formation = $obj->getId_formation();
        $id_nationaliter = $obj->getId_nationaliter();
        $nom = $obj->getNom_stagiaire();
        $prenom = $obj->getPrenom_stagiaire();

        $result->bindParam(':id_stagiaire', $id_stagiaire);
        $result->bindParam(':id_formation', $id_formation);
        $result->bindParam(':id_nationaliter', $id_nationaliter);
        $result->bindParam(':nom', $nom);
        $result->bindParam(':prenom', $prenom);

        $result->execute();
    }

    public function getOne_stagiaire($id)
    {
        $sql = "SELECT ID_STAGIAIRE,ID_FORMRATION,type_formation.NOM_FORMATION AS nom_formation,stagiaire.ID_NATIONALITER,nationaliter.LABELLE_NATIONALITER,NOM_STAGIERE,PRENOM_STAGIERE FROM `stagiaire` 
        JOIN nationaliter ON nationaliter.ID_NATIONALITER = stagiaire.ID_NATIONALITER
        JOIN type_formation ON stagiaire.ID_FORMRATION = type_formation.ID_FORMATION
        WHERE ID_STAGIAIRE = :id";

        $result = $this->getC()->prepare($sql);

        $result->bindParam(":id", $id);

        $result->execute();
        return $result->fetch();
    }
}
?>