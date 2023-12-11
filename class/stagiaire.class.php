<?php
class Stagiaire
{
    private string $id_stagiaire;
    private string $id_formation;
    private string $id_nationaliter;
    private string $nom_stagiaire;
    private string $prenom_stagiaire;

    public function setId_stagiaire($id)
    {
        $this->id_stagiaire = $id;
    }
    public function getId_stagiaire()
    {
        return $this->id_stagiaire;
    }
    public function setId_formation($formation)
    {
        $this->id_formation = $formation;
    }
    public function getId_formation()
    {
        return $this->id_formation;
    }
    public function setId_nationaliter($nationaliter)
    {
        $this->id_nationaliter = $nationaliter;
    }
    public function getId_nationaliter()
    {
        return $this->id_nationaliter;
    }
    public function setPrenom_stagiaire($prenom)
    {
        $this->prenom_stagiaire = $prenom;
    }
    public function getPrenom_stagiaire()
    {
        return $this->prenom_stagiaire;
    }
    public function setNom_stagiaire($nom)
    {
        $this->nom_stagiaire = $nom;
    }
    public function getNom_stagiaire()
    {
        return $this->nom_stagiaire;
    }
}

?>