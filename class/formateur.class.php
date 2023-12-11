<?php
class Formateur
{
    private string $id_formateur;
    private string $nom_formateur;
    private string $id_salle;
    private string $nom_salle;
    private array $formation;

    public function setId_formateur($id)
    {
        $this->id_formateur = $id;
    }
    public function getId_formateur()
    {
        return $this->id_formateur;
    }
    public function setFormation($formation)
    {
        $this->formation = $formation;
    }
    public function getFormation()
    {
        return $this->formation;
    }
    public function setId_salle($id)
    {
        $this->id_salle = $id;
    }
    public function getId_salle()
    {
        return $this->id_salle;
    }
    public function setNom_salle($nom)
    {
        $this->nom_salle = $nom;
    }
    public function getNom_salle()
    {
        return $this->nom_salle;
    }
    public function setNom_formateur($nom)
    {
        $this->nom_formateur = $nom;
    }
    public function getNom_formateur()
    {
        return $this->nom_formateur;
    }
}

?>