import { Router } from 'express';
import * as ordersController from '../controllers/orders.controller.js';
import * as authMiddleware from '../middleware/authMiddleware.js';

const router = Router();

router.route('/').post(authMiddleware.protect, ordersController.addOrderItems);

router
  .route('/')
  .get(
    authMiddleware.protect,
    authMiddleware.admin,
    ordersController.getAllOrders
  );
router.route('/mine').get(authMiddleware.protect, ordersController.getMyOrders);
router.route('/:id').get(authMiddleware.protect, ordersController.getOrderById);

router
  .route('/:id/pay')
  .put(authMiddleware.protect, ordersController.updateOrderToPaid);
router
  .route('/:id/deliver')
  .put(
    authMiddleware.protect,
    authMiddleware.admin,
    ordersController.updateOrderToDelivered
  );

export default router;
