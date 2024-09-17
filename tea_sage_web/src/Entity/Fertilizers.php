<?php

namespace App\Entity;

use App\Repository\FertilizersRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: FertilizersRepository::class)]
class Fertilizers
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column(length: 100)]
    private ?string $type = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $description = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $chemicalComposition = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $applicationMethod = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $optimalTiming = null;

    /**
     * @var Collection<int, Dieseases>
     */
    #[ORM\ManyToMany(targetEntity: Dieseases::class, mappedBy: 'fertilizers')]
    private Collection $dieseases;

    public function __construct()
    {
        $this->dieseases = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): static
    {
        $this->type = $type;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getChemicalComposition(): ?string
    {
        return $this->chemicalComposition;
    }

    public function setChemicalComposition(?string $chemicalComposition): static
    {
        $this->chemicalComposition = $chemicalComposition;

        return $this;
    }

    public function getApplicationMethod(): ?string
    {
        return $this->applicationMethod;
    }

    public function setApplicationMethod(?string $applicationMethod): static
    {
        $this->applicationMethod = $applicationMethod;

        return $this;
    }

    public function getOptimalTiming(): ?string
    {
        return $this->optimalTiming;
    }

    public function setOptimalTiming(?string $optimalTiming): static
    {
        $this->optimalTiming = $optimalTiming;

        return $this;
    }

    /**
     * @return Collection<int, Dieseases>
     */
    public function getDieseases(): Collection
    {
        return $this->dieseases;
    }

    public function addDiesease(Dieseases $diesease): static
    {
        if (!$this->dieseases->contains($diesease)) {
            $this->dieseases->add($diesease);
            $diesease->addFertilizer($this);
        }

        return $this;
    }

    public function removeDiesease(Dieseases $diesease): static
    {
        if ($this->dieseases->removeElement($diesease)) {
            $diesease->removeFertilizer($this);
        }

        return $this;
    }
}
