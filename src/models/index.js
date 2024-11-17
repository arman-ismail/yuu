const User = require('./User');
const BookClub = require('./BookClub');
const Book = require('./Book');
const BookReading = require('./BookReading');
const BookSummary = require('./BookSummary');
const BookClubMembership = require('./BookClubMembership');

// Define relationships
User.belongsToMany(BookClub, { through: BookClubMembership });
BookClub.belongsToMany(User, { through: BookClubMembership });

BookClub.belongsToMany(Book, { through: BookReading });
Book.belongsToMany(BookClub, { through: BookReading });

User.hasMany(BookSummary);
Book.hasMany(BookSummary);
BookClub.hasMany(BookSummary);

module.exports = {
  User,
  BookClub,
  Book,
  BookReading,
  BookSummary,
  BookClubMembership
};