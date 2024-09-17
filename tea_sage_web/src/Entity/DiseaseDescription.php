<?php

namespace App\Entity;

use App\Repository\DiseaseDescriptionRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: DiseaseDescriptionRepository::class)]
class DiseaseDescription
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Dieseases $diesease = null;

    #[ORM\Column(length: 255)]
    private ?string $scientificName = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $description = null;

    #[ORM\Column(type: Types::JSON, nullable: true)]
    private ?array $damage = [];

    #[ORM\Column(type: Types::JSON, nullable: true)]
    private ?array $affectedAreas = [];

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $seasonality = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDiesease(): ?Dieseases
    {
        return $this->diesease;
    }

    public function setDiesease(?Dieseases $diesease): void
    {
        $this->diesease = $diesease;
    }



    public function getScientificName(): ?string
    {
        return $this->scientificName;
    }

    public function setScientificName(string $scientificName): static
    {
        $this->scientificName = $scientificName;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getDamage(): ?array
    {
        return $this->damage;
    }

    public function setDamage(?array $damage): void
    {
        $this->damage = $damage;
    }

    public function getAffectedAreas(): ?array
    {
        return $this->affectedAreas;
    }

    public function setAffectedAreas(?array $affectedAreas): void
    {
        $this->affectedAreas = $affectedAreas;
    }

    public function getSeasonality(): ?string
    {
        return $this->seasonality;
    }

    public function setSeasonality(?string $seasonality): static
    {
        $this->seasonality = $seasonality;

        return $this;
    }
}
