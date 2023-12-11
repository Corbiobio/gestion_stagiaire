<?php
class Formation
{
    private string $id_stagiaire;
    private string $id_formateur;
    private string $date_start;
    private string $date_end;

    public function setId_stagiaire($id)
    {
        $this->id_stagiaire = $id;
    }
    public function getId_stagiaire()
    {
        return $this->id_stagiaire;
    }
    public function setId_formateur($id)
    {
        $this->id_formateur = $id;
    }
    public function getId_formateur()
    {
        return $this->id_formateur;
    }
    public function setDate_start($date)
    {
        $this->date_start = $date;
    }
    public function getDate_start()
    {
        return $this->date_start;
    }
    public function setDate_end($date)
    {
        $this->date_end = $date;
    }
    public function getDate_end()
    {
        return $this->date_end;
    }
}
?>