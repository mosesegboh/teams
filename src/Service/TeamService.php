<?php

/**
 * Class TeamService
 *
 * PHP Version >= 8.1
 *
 * @category Service
 * @package  App\Service
 * @author   Moses Egboh <mosesegboh@yahoo.com>
 * @license  https://github.com/mosesegboh/teams.git MIT
 * @link     https://github.com/mosesegboh/teams.git
 */

namespace App\Service;

use App\Entity\Team;
use App\Entity\Player;
use App\Repository\TeamRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

/**
 * Class TeamService
 *
 * PHP Version >= 8.1
 *
 * @category Service
 * @package  App\Service
 * @author   Moses Egboh <mosesegboh@yahoo.com>
 * @license  https://github.com/mosesegboh/teams.git MIT
 * @link     https://github.com/mosesegboh/teams.git
 */
class TeamService implements TeamServiceInterface
{
    /**
     * Team Repository
     *
     * @var TeamRepository
     */
    private $_teamRepository;

    /**
     * Entity Manager
     *
     * @var EntityManagerInterface
     */
    private $_entityManager;

    /**
     * Validator Interface
     *
     * @var ValidatorInterface
     */
    private $_validator;

    /**
     * Validation errors array
     *
     * @var Array
     */
    private array $_validationErrors = [];

    /**
     * TeamService constructor
     *
     * @param TeamRepository         $teamRepository Team Repository
     * @param EntityManagerInterface $entityManager  Entity ManagerInterface
     * @param ValidatorInterface     $validator      ValidatorInterface
     */
    public function __construct(TeamRepository $teamRepository,
        EntityManagerInterface $entityManager,
        ValidatorInterface $validator
    ) {
        $this->_teamRepository = $teamRepository;
        $this->_entityManager = $entityManager;
        $this->_validator = $validator;
    }

    /**
     * Get all Teams
     *
     * @param int $page  the current page
     * @param int $limit the limit of resources to get
     *
     * @return array<Team>
     */
    public function getAllTeams(int $page, int $limit): array
    {
        return $this->_teamRepository->findBy(
            [],
            null, $limit,
            ($page - 1) * $limit
        );
    }

    /**
     * Create a new team
     *
     * @param string $name         Name of the team
     * @param string $country      country of the team
     * @param float  $moneyBalance the balance of the team
     * @param array  $players      the players belonging to the team
     *
     * @return Team
     */
    public function createTeam(string $name,
        string $country,
        float $moneyBalance,
        array $players
    ): ?Team {
        $team = new Team();
        $team->setName($name)
            ->setCountry($country)
            ->setBalance($moneyBalance);

        foreach ($players as $playerData) {
            $player = new Player();
            $player->setFirstName($playerData['firstName']);
            $player->setLastName($playerData['lastName']);
            $player->setTeam($team);
            $team->addPlayer($player);
        }

        $errors = $this->_validator->validate($team);

        if (count($errors) > 0) {
            $errorMessages = [];
            foreach ($errors as $error) {
                $propertyPath = $error->getPropertyPath();
                $message = $error->getMessage();
                $errorMessages[] = "{$propertyPath}: {$message}";
            }
            $this->_validationErrors = $errorMessages;
            return null;
        }

        $this->_entityManager->persist($team);
        $this->_entityManager->flush();

        return $team;
    }

    /**
     * Buy a player
     *
     * @param Team   $buyer  buyer of the player
     * @param Team   $seller seller of the player
     * @param Player $player player of the transaction
     * @param float  $amount the amount of the transaction
     *
     * @return void
     */
    public function buyPlayer(Team $buyer,
        Team $seller,
        Player $player,
        float $amount
    ): void {
        $buyer->setBalance($buyer->getBalance() - $amount);
        $seller->setBalance($seller->getBalance() + $amount);

        $player->setTeam($buyer);

        $this->_entityManager->flush();
    }

    /**
     * Get a specific team by ID.
     *
     * @param int $id The ID of the team to retrieve.
     *
     * @return Team|null Returns the team if found, or null if not found.
     */
    public function getTeam(int $id): ?Team
    {
        return $this->_teamRepository->find($id);
    }

    /**
     * Count the number team records returned
     *
     * @return int Returns the number of team objects.
     */
    public function countTeams(): int
    {
        return $this->_teamRepository->count([]);
    }

    /**
     * Get the validation errors in an array
     *
     * @return array Returns the validation errors.
     */
    public function getValidationErrors(): array
    {
        return $this->_validationErrors;
    }
}

