<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\FutbolService;

class FutbolController extends Controller
{
    public function __construct(FutbolService $service){
        $this->service = $service;
    }

    /**
     * Return data from table countrys
     */
    public function getCountrys(){
        $data =  $this->service->getCountryService();
        return NormalizeResult::index($data);
    }

    /**
     * Return data from table positions
     */
    public function getPositions(){
        $data =  $this->service->getPositionsService();
        return NormalizeResult::index($data);
    }

    /**
     * Return data from table teams
     */
    public function getTeams(){
        $data =  $this->service->getTeamsService();
        return NormalizeResult::index($data);
    }

    /**
     * Return data of search to player
     */
    public function searchByFilterPlayer(Request $request){
        $data = $this->service->searchByFilterPlayerService($request);
        return NormalizeResult::index($data);
    }
}
