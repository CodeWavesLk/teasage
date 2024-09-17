<?php

namespace App\Controller\Home;

use App\Entity\Dieseases;
use App\Entity\DiseaseDescription;
use App\Entity\FDRelation;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


#[Route('/fertilizer')]
class FertilizerController extends AbstractController
{
    #[Route('/{id}/{code}')]
    public function getFertilizerAction(string $code, int $id, Request $request,EntityManagerInterface $em):Response
    {
        $disease = $em->getRepository(Dieseases::class)->find($id);
        $fdRelation = [];
        $diseaseDescription = null;
        $fertilizer = [];
        if(!empty($disease))
        {
            $fdRelation = $em->getRepository(FDRelation::class)->findBy([
                'diesease' => $disease
            ]);
            if($fdRelation)
            {
                foreach ($fdRelation as $fd)
                {
                    $fertilizer[] = $fd->getFertilizer();
                }
            }
            $diseaseDescription = $em->getRepository(DiseaseDescription::class)->findOneBy([
                'diesease' => $disease
            ]);
        }

        $imageDir = $this->getParameter('kernel.project_dir') . '/public/img/tea-diseases/'.$code;
        $images = array_diff(scandir($imageDir), array('..', '.'));

        return $this->render('fertilizer/fertilizer.html.twig',[
            'info' => $fdRelation,
            'disease' => $disease,
            'description' => $diseaseDescription,
            'images' => $images,
            'code' => $code,
            'fertilizers' => $fertilizer,
        ]);

    }

    private function camelToUpperSpaces(string $camelCaseStr): string
    {
        $result = preg_replace('/(?<!^)(?=[A-Z])/', '_', $camelCaseStr);
        return strtoupper($result);
    }

}