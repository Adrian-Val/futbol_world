import React from 'react'
import { Image, Row, Col } from 'react-bootstrap'
import logo from '../img/logo.png';

const Header = () => {
    return (
        <header>
            <Row className='bg-light'>
                <Col className='col-md-1 py-3 px-5 text-center'>
                    <Image src={logo} className='logoImg' />
                </Col>
                <Col className='col-md-8 py-3 px-5 text-start'>
                    <h5 className='color-marron'>Futbol World</h5> 
                    <h6 className='noneBold'><small>Conoce las estadísticas de tus jugadores favoritos</small></h6>
                </Col>
            </Row>
        </header>
    )
}

export default Header
