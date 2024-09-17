<?php

namespace App\Entity;

use App\Repository\FDRelationRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: FDRelationRepository::class)]
class FDRelation
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Fertilizers $fertilizer = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Dieseases $diesease = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $effectiveness = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $applicationTiming = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFertilizer(): ?Fertilizers
    {
        return $this->fertilizer;
    }

    public function setFertilizer(?Fertilizers $fertilizer): static
    {
        $this->fertilizer = $fertilizer;

        return $this;
    }

    public function getDiesease(): ?Dieseases
    {
        return $this->diesease;
    }

    public function setDiesease(?Dieseases $diesease): static
    {
        $this->diesease = $diesease;

        return $this;
    }

    public function getEffectiveness(): ?string
    {
        return $this->effectiveness;
    }

    public function setEffectiveness(string $effectiveness): static
    {
        $this->effectiveness = $effectiveness;

        return $this;
    }

    public function getApplicationTiming(): ?string
    {
        return $this->applicationTiming;
    }

    public function setApplicationTiming(string $applicationTiming): static
    {
        $this->applicationTiming = $applicationTiming;

        return $this;
    }
}
