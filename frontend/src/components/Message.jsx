import { Alert } from 'react-bootstrap';

const Message = ({ variant, children }) => {
  return <Alert variant={variant}>{children}</Alert>;
};
//poruke sto iskacu
Message.defaultProps = {
  variant: 'info',
};

export default Message;
