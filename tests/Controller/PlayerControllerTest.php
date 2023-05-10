<?php

namespace App\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class PlayerControllerTest extends WebTestCase
{
    public function testListPlayers(): void
    {
        $client = static::createClient();
        $crawler = $client->request('GET', '/players');

        $this->assertResponseIsSuccessful();
        $this->assertResponseHeaderSame(
            'content-type',
            'application/json');
    }
}
