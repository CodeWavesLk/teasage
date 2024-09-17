<?php

namespace App\Controller\Home;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


#[Route('/')]
class LandingPageController extends AbstractController
{
    #[Route('',name:'home_page')]
    public function homeAction(): Response
    {
        return $this->render('Home/landing_page.html.twig');
    }

}