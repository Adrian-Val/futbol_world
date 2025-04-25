import React from 'react'
import { Image, Row, Col } from 'react-bootstrap';
import logo from '../img/logo.png';

const Footer = () => {
    return (
        <footer>
            <Row className='border-gray mt-5'>
                <Col className='py-3 col-md-12 px-5 text-center'><Image src={logo} />
                    <p>copyright (©)</p>
                </Col>
            </Row>
        </footer>
    )
}

export default Footer
