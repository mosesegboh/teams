<?php

namespace App\Service;

use App\Entity\Player;

/**
 * Interface PlayerServiceInterface
 * @package App\Service
 */
interface PlayerServiceInterface
{
    /**
     * Get all players.
     *
     * @return array An array of Player objects.
     */
    public function getAllPlayers(): array;

    /**
     * Get a specific player by ID.
     *
     * @param int $id The ID of the player to retrieve.
     * @return Player|null Returns the player if found, or null if not found.
     */
    public function getPlayer(int $id): ?Player;
}
