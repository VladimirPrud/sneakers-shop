import { Container, Row, Col, Button, Image, Spinner, Table } from 'react-bootstrap'
import { useEffect, useState, useContext } from 'react'
import { fetchOneProduct, fetchProdRating } from '../http/catalogAPI.js'
import { useParams } from 'react-router-dom'
import { append } from '../http/basketAPI.js'
import { AppContext } from '../components/AppContext.js'

const Product = () => {
    const { id } = useParams()
    const { basket } = useContext(AppContext)
    const [product, setProduct] = useState(null)
    const [rating, setRating] = useState(null)

    useEffect(() => {
        fetchOneProduct(id).then(data => setProduct(data))
        fetchProdRating(id).then(data => setRating(data))
    }, [id])

    const handleClick = (productId) => {
        append(productId).then(data => {
            basket.products = data.products
        })
    }

    if (!product) {
        return <Spinner animation="border" />
    }

    return (
        <Container style={{background: '#fff', borderRadius: '15px', width: '1000px'}}>
            <Row className="mt-3 mb-3">
                <Col lg={4} style={{marginRight: '170px', marginLeft: '50px'}}>
                    <div >
                        {product.image ? (
                            <Image style={{width: '400px', height: '400px'}} src={process.env.REACT_APP_IMG_URL + product.image} />
                        ) : (
                            <Image src="http://via.placeholder.com/300" />
                        )}
                    </div>
                </Col>
                <Col lg={5} style={{marginTop: '50px'}}>
                    <h1>{product.name}</h1>
                    <h3>{product.price}.00 руб.</h3>
                    <p>Бренд: {product.brand.name}</p>
                    <p>Категория: {product.category.name}</p>
                    <div>
                        {rating ? (
                            <p>Рейтинг: {rating.rating}, голосов {rating.votes}</p>
                        ) : (
                            <Spinner animation="border" />
                        )}
                    </div>
                    <Button onClick={() => handleClick(product.id)}>Добавить в корзину</Button>
                </Col>
            </Row>
            {!!product.props.length &&
                <Row>
                    <Col>
                        <h3>Характеристики</h3>
                            <Table bordered hover size="sm">
                                <tbody>
                                    {product.props.map(item => 
                                        <tr key={item.id} style={{border: 0}}>
                                            <td style={{border: 0, fontWeight: 'bold', width: '300px'}}>{item.name}</td>
                                            <td style={{border: 0}}>{item.value}</td>
                                        </tr>
                                    )}
                                </tbody>
                            </Table>
                    </Col>
                </Row>
            }
        </Container>
    )
}

export default Product