import { Spinner } from 'react-bootstrap';
//ya ucitavanje
const Loader = ({ size = '100px' }) => {
  return (
    <Spinner
      animation='border'
      role='status'
      style={{
        width: size,
        height: size,
        margin: 'auto',
        display: 'block',
      }}
    ></Spinner>
  );
};

export default Loader;
