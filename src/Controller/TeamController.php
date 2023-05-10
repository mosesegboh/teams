<?php

/**
 * Class TeamController
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

use App\Service\TeamServiceInterface;
use App\Service\PlayerServiceInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Serializer\SerializerInterface;


/**
 * Class TeamController
 *
 * @category Controller
 * @package  App\Controller
 * @author   Moses Egboh <mosesegboh@yahoo.com>
 * @license  https://github.com/mosesegboh/teams.git MIT
 * @link     https://github.com/mosesegboh/teams.git
 */
class TeamController extends AbstractController
{
    /**
     * TeamController constructor.
     *
     * @param TeamServiceInterface   $teamService   Team service
     * @param SerializerInterface    $serializer    Serializer
     * @param PlayerServiceInterface $playerService Player service
     */
    public function __construct(
        private TeamServiceInterface   $teamService,
        private SerializerInterface $serializer,
        private PlayerServiceInterface $playerService
    ) {
    }

    /**
     * Get A list of al teams and their players
     *
     * @param Request $request Incoming Request
     *
     * @return JsonResponse Json response object
     */
    #[Route('/teams', methods: ['GET'])]
    public function listTeams(Request $request): JsonResponse
    {
        $page = (int) $request->query->get('page', 1);
        $limit = (int) $request->query->get('limit', 10);
        $teams = $this->teamService->getAllTeams($page, $limit);

        $serializedTeams = $this->serializer->serialize(
            $teams, 'json',
            ['groups' => 'team_list']
        );

        return JsonResponse::fromJsonString($serializedTeams);
    }

    /**
     *Add a new team
     *
     * @param Request $request Incoming Request
     *
     * @return JsonResponse Json response object
     */
    #[Route('/teams', methods: ['POST'])]
    public function addTeam(Request $request): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        try {
            $team = $this->teamService->createTeam(
                $data['name'],
                $data['country'],
                $data['balance'],
                $data['players']
            );

            if ($team === null) {
                $validationErrors = $this->teamService->getValidationErrors();
                return $this->json(
                    [
                    'message' => 'Validation failed!',
                    'errors' => $validationErrors
                    ]
                );
            }

            $serializedTeam = $this->serializer->serialize(
                $team, 'json',
                ['groups' => 'team_details']
            );

            return new JsonResponse(
                [
                'message' => 'Team created successfully',
                'team' => json_decode($serializedTeam, true)],
                JsonResponse::HTTP_CREATED
            );
        } catch (\Exception $e) {
            return $this->json(
                ['message' => $e->getMessage()],
                Response::HTTP_INTERNAL_SERVER_ERROR
            );
        }
    }

    /**
     * Buy or Sell a Player
     *
     * @param Request $request Incoming Request
     *
     * @return JsonResponse Json response object
     */
    #[Route('/teams/buy-sell-player', methods: ['POST'])]
    public function buySellPlayer(Request $request): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        if ($data['transactionType'] == "Buying") {
            $seller = $data['offeror'];
            $buyer = $data['teamId'];
        }

        if ($data['transactionType'] == "Selling") {
            $seller = $data['teamId'];
            $buyer = $data['offeror'];
        }

        $buyer = $this->teamService->getTeam($buyer);
        $seller = $this->teamService->getTeam($seller);
        $player = $this->playerService->getPlayer($data['playerId']);

        $this->teamService->buyPlayer($buyer, $seller, $player, $data['amount']);

        return new JsonResponse(
            [
            'status' => 'success',
            'message' => 'Player transaction successfully processed.',
            ]
        );
    }

    /**
     * Get team by ID.
     *
     * @param int $id ID of a particular team
     *
     * @return JsonResponse Json Response object
     *
     * @throws NotFoundHttpException Error thrown
     */
    #[Route('/team/{id}', name: 'get_team', methods: ['GET'])]
    public function getTeam(int $id): JsonResponse
    {
        $team = $this->teamService->getTeam($id);

        if (!$team) {
            throw $this->createNotFoundException('No team found for id ' . $id);
        }

        $serializedTeam = $this->serializer->serialize(
            $team, 'json',
            ['groups' => 'team_list']
        );
        return JsonResponse::fromJsonString($serializedTeam);
    }
}
