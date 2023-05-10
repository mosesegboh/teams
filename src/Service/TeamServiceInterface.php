<?php

/**
 * Interface TeamServiceInterface
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

/**
 * Interface TeamServiceInterface
 * @package App\Service
 */
interface TeamServiceInterface
{
    /**
     * Get all teams.
     *
     * @param int $page The current page.
     * @param int $limit The number of teams per page.
     * @return array An array of Team objects.
     */
    public function getAllTeams(int $page, int $limit): array;

    /**
     * Create a new team.
     *
     * @param string $name The name of the team.
     * @param string $country The country the team is based in.
     * @param float $moneyBalance The starting money balance for the team.
     * @param array $players For validating data
     * @return Team The created Team object.
     */
    public function createTeam(string $name, string $country, float $moneyBalance, array $players): ?Team;

    /**
     * Facilitate the buying of a player from one team to another.
     *
     * @param Team $buyer The buying team.
     * @param Team $seller The selling team.
     * @param Player $player The player being bought.
     * @param float $amount The transfer amount for the player.
     * @return void
     */
    public function buyPlayer(Team $buyer, Team $seller, Player $player, float $amount): void;

    /**
     * Get a specific team by ID.
     *
     * @param int $id The ID of the team to retrieve.
     * @return Team|null Returns the team if found, or null if not found.
     */
    public function getTeam(int $id): ?Team;

    /**
     * count the number team records returned
     *
     * @return int Returns the number of team objects.
     */
    public function countTeams(): int;
}

