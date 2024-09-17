<?php

namespace App\Controller\Home;

use App\Entity\Dieseases;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/prediction')]
class HomeController extends AbstractController
{

    #[Route('',name:'prediction_page')]
    public function homeAction(): Response
    {
        return $this->render('Home/home.html.twig');
    }


    #[Route('/ajax/disease/id/{code}',name:'disease_id_url')]
    public function diseaseIdAction(Request $request,EntityManagerInterface $em,string $code):JsonResponse
    {
        $id = null;
        $name = null;
        $disease = $em->getRepository(Dieseases::class)->findOneBy([
            'isActive' => true,
            'isDeleted' => false,
            'metaCode' => $code
        ]);

        if(!empty($disease))
        {
            $id = $disease->getId();
        }

        return new JsonResponse($id);
    }

}

