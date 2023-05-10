<?php

/**
 * Class PlayerController
 *
 * PHP Version >= 8.1
 *
 * @category Controller
 * @package  App\Controller
 * @author   Moses Egboh <mosesegboh@yahoo.com>
 * @license  https://github.com/mosesegboh/teams.git MIT
 * @link     https://github.com/mosesegboh/teams.git
 */

namespace App\Controller;

use App\Service\PlayerServiceInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * Class PlayerController
 *
 * @category Controller
 * @package  App\Controller
 * @author   Moses Egboh <mosesegboh@yahoo.com>
 * @license  https://github.com/mosesegboh/teams.git MIT
 * @link     https://github.com/mosesegboh/teams.git
 */
class PlayerController extends AbstractController
{
    /**
     * PlayerController constructor.
     *
     * @param PlayerServiceInterface $playerService Player service
     * @param SerializerInterface    $serializer    Serializer
     */
    public function __construct(
        private PlayerServiceInterface $playerService,
        private SerializerInterface $serializer,
    ) {
    }

    /**
     * Get A list of all players
     *
     * @param Request $request Incoming Request
     *
     * @return JsonResponse Json Response object
     */
    #[Route('/players', methods: ['GET'])]
    public function listPlayers(Request $request): JsonResponse
    {
        $players = $this->playerService->getAllPlayers();

        $serializedPlayers = $this->serializer->serialize(
            $players,
            'json',
            ['groups' => 'team_list']
        );

        return JsonResponse::fromJsonString($serializedPlayers);
    }
}
