import { Router } from 'express';
import * as brandsController from '../controllers/brands.controller.js';
import * as authMiddleware from '../middleware/authMiddleware.js';

const router = Router();

router
  .route('/')
  .post(
    authMiddleware.protect,
    authMiddleware.admin,
    brandsController.createBrand
  );

router.route('/').get(brandsController.getAllBrands);
router.route('/:id').get(brandsController.getBrandById);

router
  .route('/:id')
  .put(
    authMiddleware.protect,
    authMiddleware.admin,
    brandsController.updateBrand
  );

router
  .route('/:id')
  .delete(
    authMiddleware.protect,
    authMiddleware.admin,
    brandsController.deleteBrand
  );

export default router;
