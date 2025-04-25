import React from 'react'
import { Navbar, Nav } from 'react-bootstrap'
import { Link } from 'react-router-dom';

const NavBar = () => {
    return (
        <Navbar expand="lg" className='bg-light px-5 py-3' collapseOnSelect>
            <Link to="/" className='p-2 link'><i className='fas fa-home'></i></Link>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav" className='justify-content-start'>        
                <Nav className="ml-auto">
                    <Link to="/consultar-jugadores" className='p-2 link'>Consultar jugadores</Link>
                </Nav>
            </Navbar.Collapse>
        </Navbar>
    )
}

export default NavBar