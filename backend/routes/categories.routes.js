import { Router } from 'express';
import * as categoriesController from '../controllers/categories.controller.js';
import * as authMiddleware from '../middleware/authMiddleware.js';

const router = Router();

router
  .route('/')
  .post(
    authMiddleware.protect,
    authMiddleware.admin,
    categoriesController.createCategory
  );

router.route('/').get(categoriesController.getAllCategories);
router.route('/:id').get(categoriesController.getCategoryById);

router
  .route('/:id')
  .put(
    authMiddleware.protect,
    authMiddleware.admin,
    categoriesController.updateCategory
  );

router
  .route('/:id')
  .delete(
    authMiddleware.protect,
    authMiddleware.admin,
    categoriesController.deleteCategory
  );

export default router;
