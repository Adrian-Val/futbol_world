import { Row, Col } from 'react-bootstrap';
import React, { useEffect, useState } from 'react';
import axios from 'axios'
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, TablePagination  } from "@mui/material";
import 'primereact/resources/themes/nano/theme.css';

const GetPlayerByFilter = () => {
    const [player, setPlayer]           = useState('');
    const [country, setCountry]         = useState('');
    const [position, setPosition]       = useState('');
    const [team, setTeam]               = useState('');
    const [valorInicio, setValorInicio] = useState('');
    const [valorFin, setValorFin]       = useState('');

    const [data, setData] = useState([]);
    const endpoint = 'http://127.0.0.1:8000/api/searchByFilterPlayer';

    // Enviamos la busqueda
    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await axios.get(`${endpoint}?
                    player=${player}
                    &country=${country}
                    &position=${position}
                    &team=${team}
                    &valorInicio=${valorInicio}
                    &valorFin=${valorFin}
                `);
            setData(response.data);            
        } catch (error) {
            console.error("Error en la consulta:", error);
        }
    };

    // Reseteamos los valores en blanco del formulario y del datatable
    const handleReset = () => {
        setData([]) // Limpiamos la tabla

        setPlayer('');
        setCountry('');
        setPosition('');
        setTeam('');
        setValorInicio('');
        setValorFin('');
    };

    // Combos | end points
    // Countrys
    const endPointCountrys = "http://127.0.0.1:8000/api/getCountrys"
    const [countrysCombo, setCountryCombo] = useState( [] )

    useEffect(() => {
        getCountrys()
    }, [])

    const getCountrys = async () => {
        const response = await axios.get(endPointCountrys)
        setCountryCombo(response.data)
    }

    // Position
    const endPointPosition = "http://127.0.0.1:8000/api/getPositions"
    const [positionCombo, setPositionCombo] = useState( [] )

    useEffect(() => {
        getPositions()
    }, [])

    const getPositions = async () => {
        const response = await axios.get(endPointPosition)
        setPositionCombo(response.data)
    }

    // Teams
    const endPointTeams = "http://127.0.0.1:8000/api/getTeams"
    const [teamCombo, setTeamCombo] = useState( [] )

    useEffect(() => {
        getTeams()
    }, [])

    const getTeams = async () => {
        const response = await axios.get(endPointTeams)
        setTeamCombo(response.data)
    }

    // Paginate
    const [page, setPage] = useState(0);
    const [rowsPerPage, setRowsPerPage] = useState(10);

    const handleChangePage = (event, newPage) => {
        setPage(newPage);
    };

    const handleChangeRowsPerPage = (event) => {
        setRowsPerPage(parseInt(event.target.value, 10));
        setPage(0);
    };

    // Return component
    return (
        <>
            <Row className='mb-5'>
                <Col className='py-2 col-md-12 text-center bg-secondary text-white'></Col>
            </Row>
    
            <Row className='mb-5'>
                <Col className='col-md-12 text-justify font-12'>
                     <p><b>1.- Registre los parámetros de búsqueda, puede optar por más de un campo de información</b></p>
                     <hr/>
                 </Col>
            </Row>

            {/* Form */}
            <form onSubmit={handleSubmit}>
                <Row className='mt-5 mb-5'>
                    <Col className='col-md-2 text-justify font-14'>
                        <label htmlFor="player"><b>Nombre del jugador:</b></label>
                    </Col>
                    <Col className='col-md-4'>
                        <input type="text" className="form-control form-control-sm" name="player" id="player" minLength="2" maxLength="100" value={player} onChange={(e) => setPlayer(e.target.value)} />
                    </Col>
                    <Col className='col-md-2 text-justify font-14'>
                        <label htmlFor="country"><b>País:</b></label>
                    </Col>
                    <Col className='col-md-4'>
                        <select className="form-control form-control-sm" name="country" id="country" value={country} onChange={(e) => setCountry(e.target.value)}>
                            <option value="" defaultValue>Seleccione un país</option>
                            {countrysCombo.data?.map((item) => (
                                <option key={item.id} value={item.id}>
                                    {item.name}
                                </option>
                            ))}
                        </select>
                    </Col>
                </Row>

                {/* Sector & Tipo de Dictamen */}
                <Row className='mt-5 mb-5'>
                    <Col className='col-md-2 text-justify font-14'>
                        <label htmlFor="position"><b>Posición:</b></label>
                    </Col>

                    <Col className='col-md-4'>
                        <select className="form-control form-control-sm" name="position" id="position" value={position} onChange={(e) => setPosition(e.target.value)}>
                            <option value="" defaultValue>Seleccione una posición</option>
                            {positionCombo.data?.map((item) => (
                                <option key={item.id} value={item.id}>
                                    {item.name}
                                </option>
                            ))}
                        </select>
                    </Col>

                    <Col className='col-md-2 text-justify font-14'>
                        <label htmlFor="team"><b>Equipo:</b></label>
                    </Col>

                    <Col className='col-md-4'>
                        <select className="form-control form-control-sm" name="team" id="team" value={team} onChange={(e) => setTeam(e.target.value)}>
                            <option value="" defaultValue>Seleccione un equipo</option>
                            {teamCombo.data?.map((item) => (
                                <option key={item.id} value={item.id}>
                                    {item.name}
                                </option>
                            ))}
                        </select>
                    </Col>
                </Row>

                {/* Periodo de emision */}
                <Row className='mb-5'>
                    <Col className='py-1 col-md-12 text-center bg-secondary text-white'>
                    
                    <small>Complete ambos campos para realizar una busqueda por rango.</small>
                    </Col>

                    <hr />
                    <Col className='col-md-2 text-justify font-14'>
                        <label><b>Valor inicial</b></label>
                    </Col>
                
                    <Col className='col-md-4'>
                        <input type="text" className="form-control form-control-sm" name="valorInicio" id="valorInicio" value={valorInicio} onChange={(e) => setValorInicio(e.target.value)}/>
                    </Col>
                    
                    <Col className='col-md-2 text-justify font-14'>
                        <label><b>Valor final</b></label>
                    </Col>
                
                    <Col className='col-md-4'>
                        <input type="text" className="form-control form-control-sm" name="valorFin" id="valorFin" value={valorFin} onChange={(e) => setValorFin(e.target.value)}/>
                    </Col>
                </Row>

                <Row className='mt-5 mb-5'>
                    <Col className='col-md-6 d-flex justify-content-end'>
                        <button type="submit" className="btn btn-outline-success"><i className="fa-solid fa-magnifying-glass"></i> Buscar</button>
                    </Col>

                    <Col className='col-md-6 d-flex justify-content-start'>
                        <button type='button' className="btn btn-outline-danger" onClick={ () => handleReset() }><i className="fa-solid fa-broom"></i> Limpiar</button>
                    </Col>
                </Row>
             </form>

            {data.data?.length > 0 && (
                <TableContainer component={Paper} sx={{ overflowX: "auto" }}>
                    <Table>
                        <TableHead className='bg-secondary'>
                            <TableRow>
                                <TableCell className='text-white'>#</TableCell>
                                <TableCell className='text-white'>Nombre del futbolista</TableCell>
                                <TableCell className='text-white'>Valor de mercado</TableCell>
                                <TableCell className='text-white'>Dorsal</TableCell>
                                <TableCell className='text-white'>Posición</TableCell>
                                <TableCell className='text-white'>Equipo</TableCell>
                                <TableCell className='text-white'>País</TableCell>
                            </TableRow>
                        </TableHead>
                        <TableBody>
                            {data.data?.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage).map((item) => (
                                <TableRow key={item.id}>
                                    <TableCell>{item.iterador}</TableCell>
                                    <TableCell>{item.name + ' ' + item.lastname}</TableCell>
                                    <TableCell>{item.market_value}</TableCell>
                                    <TableCell>#{item.dorsal}</TableCell>
                                    <TableCell>{item.position}</TableCell>
                                    <TableCell>{item.team}</TableCell>
                                    <TableCell>{item.country}</TableCell>
                                </TableRow>
                            ))}
                        </TableBody>
                    </Table>
                    <TablePagination
                        className='bg-secondary text-white'
                        rowsPerPageOptions={[5, 10, 25]}
                        component="div"
                        count={data.data?.length}
                        rowsPerPage={rowsPerPage}
                        page={page}
                        onPageChange={handleChangePage}
                        onRowsPerPageChange={handleChangeRowsPerPage}
                    />

                </TableContainer>
            )}
        </>
    );
};

export default GetPlayerByFilter;