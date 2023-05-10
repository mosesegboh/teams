<?php

/**
 * Class PlayerService
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

use App\Entity\Player;
use App\Repository\PlayerRepository;

/**
 * Class PlayerService
 *
 * PHP Version >= 8.1
 *
 * @category Service
 * @package  App\Service
 * @author   Moses Egboh <mosesegboh@yahoo.com>
 * @license  https://github.com/mosesegboh/teams.git MIT
 * @link     https://github.com/mosesegboh/teams.git
 */
class PlayerService implements PlayerServiceInterface
{
    /**
     * PlayerRepository.
     *
     * @var PlayerRepository Player Repository
     */
    private $_playerRepository;

    /**
     * PlayerService constructor.
     *
     * @param PlayerRepository $playerRepository Player Repository
     */
    public function __construct(PlayerRepository $playerRepository)
    {
        $this->_playerRepository = $playerRepository;
    }

    /**
     * Get A list of al teams and their players
     *
     * @return array<Player>
     */
    public function getAllPlayers(): array
    {
        return $this->_playerRepository->findBy([]);
    }

    /**
     * Get a specific Player by ID.
     *
     * @param int $id The ID of the player to retrieve.
     *
     * @return Player|null Returns the player if found, or null if not found.
     */
    public function getPlayer(int $id): ?Player
    {
        return $this->_playerRepository->find($id);
    }
}
