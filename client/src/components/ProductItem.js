import { Card, Col } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom'
import '../style/anim.css'

const ProductItem = ({data}) => {
    const navigate = useNavigate()
    return (
        <Col xl={3} lg={4} sm={6} className="mt-3"  onClick={() => navigate(`/product/${data.id}`)}>
            <Card style={{width: 200, height: '340px', cursor: 'pointer', border: '0', paddingTop: '10px'}}>
                <div className="product-img">
                    {data.image ? (
                        <Card.Img variant="top" src={process.env.REACT_APP_IMG_URL + data.image} />
                    ) : (
                        <Card.Img variant="top" src="http://via.placeholder.com/200" />
                    )}
                </div>
                <Card.Body style={{height: 100, overflow: 'hidden'}}>
                    <strong>{data.brand.name}</strong>
                    <p className="mb-2">{data.name}</p>
                    <p>Цена: {data.price}</p>
                </Card.Body>
            </Card>
        </Col>
    )
}

export default ProductItem