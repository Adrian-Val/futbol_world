import React from 'react'
import Carousel from 'react-bootstrap/Carousel';
import { Image } from 'react-bootstrap'
import s1 from '../img/slider/s1.jpg';
import s2 from '../img/slider/s2.jpg';
import s3 from '../img/slider/s3.jpg';
import s4 from '../img/slider/s4.jpg';
import s5 from '../img/slider/s5.jpg';

const Home = () => {
  return (
    <>
        <Carousel>
            <Carousel.Item>
                <Image src={s1} className='d-block carrousel' />
            </Carousel.Item>

            <Carousel.Item>
                <Image src={s2} className='d-block carrousel' />
            </Carousel.Item>

            <Carousel.Item>
                <Image src={s3} className='d-block carrousel' />
            </Carousel.Item>

            <Carousel.Item>
                <Image src={s4} className='d-block carrousel' />
            </Carousel.Item>

            <Carousel.Item>
                <Image src={s5} className='d-block carrousel' />
            </Carousel.Item>
        </Carousel>
    </>
  )
}

export default Home
