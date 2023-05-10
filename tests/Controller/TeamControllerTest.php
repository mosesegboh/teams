<?php

namespace App\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use App\Entity\Team;

class TeamControllerTest extends WebTestCase
{
    public function testListTeams(): void
    {
        $client = static::createClient();
        $crawler = $client->request('GET', '/teams');

        $this->assertResponseIsSuccessful();
        $this->assertResponseHeaderSame(
            'content-type',
            'application/json');
    }

    public function testAddTeam(): void
    {
        $client = static::createClient();

        $teamData = [
            'name' => 'Test Team',
            'country' => 'Test Country',
            'balance' => 1000,
            'players' => [],
        ];

        $client->request('POST',
            '/teams',
            [], [],
            ['CONTENT_TYPE' => 'application/json'],
            json_encode($teamData));

        $this->assertResponseStatusCodeSame(201);
    }

    public function testGetTeam(): void
    {
        $client = static::createClient();

        $team = new Team();
        $team->setName('Test Team')
            ->setCountry('Test Country')
            ->setBalance(1000);

        $entityManager = self::bootKernel()
            ->getContainer()
            ->get('doctrine')
            ->getManager();
        $entityManager->persist($team);
        $entityManager->flush();

        $client->request('GET', '/team/' . $team->getId());

        $this->assertResponseIsSuccessful();
        $this->assertResponseHeaderSame(
            'content-type',
            'application/json');
    }
}
