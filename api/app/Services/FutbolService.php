<?php

namespace App\Services;

use App\Models\Country;
use App\Models\Position;
use App\Models\Team;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FutbolService
{
    /**
     * Return data of table countrys
     */
    public function getCountryService(){
        $country = Country::orderBy('name', 'ASC')->get();
        return $country;
    }

    /**
     * Return data of table positions
     */
    public function getPositionsService(){
        $positions = Position::orderBy('id', 'ASC')->get();
        return $positions;
    }

    /**
     * Return data of table teams
     */
    public function getTeamsService(){
        $teams = Team::orderBy('name', 'ASC')->get();
        return $teams;
    }

    /**
     * Return data of search to players
     */
    public function searchByFilterPlayerService(Request $request)
    {
        $player      = $request->player;
        $country     = $request->country;
        $position    = $request->position;
        $team        = $request->team;
        $valorInicio = $request->valorInicio;
        $valorFin    = $request->valorFin;

        $sql = DB::table('tbl_players')
            ->select(
                DB::raw('ROW_NUMBER() OVER(ORDER BY tbl_players.name) AS iterador'),
                'tbl_players.id',
                'tbl_players.name',
                'tbl_players.lastname',
                'tbl_players.market_value',
                'tbl_players.dorsal',
                'tbl_positions.name AS position',
                'tbl_teams.name AS team',
                'tbl_countrys.name AS country'
            )
            ->join('tbl_positions', 'tbl_players.id_tbl_position',  '=', 'tbl_positions.id')
            ->join('tbl_teams',     'tbl_players.id_tbl_team', '=', 'tbl_teams.id')
            ->join('tbl_countrys',  'tbl_players.id_tbl_country',  '=', 'tbl_countrys.id')
           
            ->when($player, function ($query) use ($player) {
                return $query->where('tbl_players.name', 'LIKE', '%'.$player.'%')->orWhere('tbl_players.lastname', 'LIKE', '%'.$player.'%');
            })
            ->when($country, function ($query) use ($country) {
                return $query->where('tbl_players.id_tbl_country', '=', $country);
            })
            ->when($position, function ($query) use ($position) {
                return $query->where('tbl_players.id_tbl_position', '=', $position);
            })
            ->when($team, function ($query) use ($team) {
                return $query->where('tbl_players.id_tbl_team', '=', $team);
            })
            ->when($valorInicio, function ($query) use ($valorInicio, $valorFin) {
                return $query->whereBetween('tbl_players.market_value', [$valorInicio, $valorFin]);

            })
            ->get();

        return $sql;
    }
}
