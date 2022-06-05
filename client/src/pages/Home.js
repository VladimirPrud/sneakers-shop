import { Container, Row, Col, Image, Carousel } from 'react-bootstrap'
import { Link } from 'react-router-dom'

const Home = () => {
    return(
        <Container className="container">
            <Carousel>
                <Carousel.Item>
                    <img
                    className="d-block w-100"
                    src="image/slider1.jpg"
                    alt="First slide"
                    />
                </Carousel.Item>
                <Carousel.Item>
                    <img
                    className="d-block w-100"
                    src="image/slider2.jpg"
                    alt="Second slide"
                    />
                </Carousel.Item>
                <Carousel.Item>
                    <img
                    className="d-block w-100"
                    src="image/slider3.jpg"
                    alt="Third slide"
                    />
                </Carousel.Item>
            </Carousel>
            <Row style={{display: 'flex'}} className=" my-4">
                <Col sm={5}>
                    <h1 style={{marginTop: '110px', paddingBottom: '20px', width: '428px', fontSize: '48px', color: '#fff'}}> Don't be like everyone else </h1>
                    <p style={{width: '339px', fontSize: '14px', color: '#fff', paddingBottom: '20px', fontWeight: '200'}} className="">Мы собрали для вас лучшее из лучших. Представляем вашему вниманию. Лучшее кроссовки от лучших Бреднов мира </p>
                    <Link style={{textDecoration: 'none', color: '#fff', background: '#0d6efd', padding: '10px 35px', borderRadius: '5px'}} to="/shop">Перейти в каталог</Link>
                </Col>
                <Col sm={7}>
                    <Image src="image/new-collection.jpg" fluid rounded />
                </Col>
            </Row>
        </Container>
    )
}

export default Home