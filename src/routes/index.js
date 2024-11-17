const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const bookClubController = require('../controllers/bookClubController');
const auth = require('../middleware/auth');
const admin = require('../middleware/admin');

// User routes
router.get('/users', auth, admin, userController.getAllUsers);
router.post('/users', userController.createUser);
router.put('/users/:id', auth, admin, userController.updateUser);
router.delete('/users/:id', auth, admin, userController.deleteUser);

// Book club routes
router.get('/book-clubs', auth, bookClubController.getAllBookClubs);
router.post('/book-clubs', auth, admin, bookClubController.createBookClub);
router.get('/book-clubs/:id/analytics', auth, bookClubController.getBookClubAnalytics);

module.exports = router;