const { BookClub, Book, BookReading, BookSummary } = require('../models');

exports.getAllBookClubs = async (req, res) => {
  try {
    const bookClubs = await BookClub.findAll();
    res.json(bookClubs);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.createBookClub = async (req, res) => {
  try {
    const bookClub = await BookClub.create(req.body);
    res.status(201).json(bookClub);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.getBookClubAnalytics = async (req, res) => {
  try {
    const bookClub = await BookClub.findByPk(req.params.id);
    if (!bookClub) return res.status(404).json({ error: 'Book club not found' });

    const totalBooks = await BookReading.count({ where: { bookClubId: bookClub.id } });
    const completedBooks = await BookReading.count({ 
      where: { 
        bookClubId: bookClub.id,
        status: 'completed'
      }
    });
    const averageRating = await BookSummary.average('rating', {
      where: { bookClubId: bookClub.id }
    });

    res.json({
      totalBooks,
      completedBooks,
      averageRating: averageRating || 0
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};