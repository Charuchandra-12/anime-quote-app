const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

const quotes = [
  { anime: 'Naruto Shippuden', character: 'Naruto Uzumaki', quote: 'I never give up... I never go back on my word!' },
  { anime: 'One Piece', character: 'Monkey D. Luffy', quote: 'I’m gonna be king of the pirates!' },
  { anime: 'Naruto Shippuden', character: 'Itachi Uchiha', quote: 'People live their lives bound by what they accept as correct and true. That’s how they define "reality".' },
  { anime: 'One Piece', character: 'Roronoa Zoro', quote: 'When the world shoves you around, you just gotta stand up and shove back.' },
  { anime: 'Naruto Shippuden', character: 'Pain', quote: 'Justice comes from vengeance but that justice only breeds more vengeance.' },
  { anime: 'One Piece', character: 'Sanji', quote: 'A man forgives a woman’s lies.' },
  { anime: 'Naruto Shippuden', character: 'Jiraiya', quote: 'A place where someone still thinks about you is a place you can call home.' },
  { anime: 'One Piece', character: 'Nico Robin', quote: 'Fools who don’t respect the past are likely to repeat it.' },
  { anime: 'Naruto Shippuden', character: 'Kakashi Hatake', quote: 'I\'m not gonna run away, I never go back on my word! That\'s my nindo: my ninja way!' },
  { anime: 'One Piece', character: 'Usopp', quote: 'It’s not about possible or impossible. I’m doing it because I want to.' },
  { anime: 'Naruto Shippuden', character: 'Sasuke Uchiha', quote: 'My dream is not to become the Hokage, but to be the darkness that will protect the Hokage.' },
  { anime: 'One Piece', character: 'Tony Tony Chopper', quote: 'I realized that back then, the reason I wanted to become human was that I really just wanted to have friends. Now, I just want to be a monster that can help Luffy.' },
  { anime: 'Naruto Shippuden', character: 'Shikamaru Nara', quote: 'What a drag...' },
  { anime: 'One Piece', character: 'Franky', quote: 'Super!' },
  { anime: 'Naruto Shippuden', character: 'Hinata Hyuga', quote: 'When I watch you, I feel strong, like I can do anything - that even I am worth something.' },
  { anime: 'One Piece', character: 'Brook', quote: 'What keeps me alive in this world is neither bodily organs, nor muscles - it\'s my soul!' },
  { anime: 'Naruto Shippuden', character: 'Rock Lee', quote: 'A hero is not the one who never falls. He is the one who gets up, again and again, never losing sight of his dreams.' },
  { anime: 'One Piece', character: 'Nami', quote: 'Life is like a pencil that will surely run out, but will leave the beautiful writing of life.' },
  {
    anime: 'Naruto Shippuden', character: 'Gaara', quote: "Just because someone is important to you, it doesn't necessarily mean that person is good."
  },
  { anime: 'One Piece', character: 'Jinbe', quote: 'It is a sad truth that greater the authority a person possesses, the more he feels he can play with the lives of others.' },
  { anime: 'Naruto Shippuden', character: 'Minato Namikaze', quote: 'The longer you live… The more you realize that reality is just made of pain, suffering and emptiness.' },
  { anime: 'One Piece', character: 'Dracule Mihawk', quote: 'The world\'s greatest swordsman, that is a title that is earned, not given.' },
  { anime: 'Naruto Shippuden', character: 'Neji Hyuga', quote: 'Fear. That is what we live with. And we live it everyday. Only in death are we free of it.' },
  { anime: 'One Piece', character: 'Zeff', quote: 'A man dies when he is forgotten!' },
  { anime: 'Naruto Shippuden', character: 'Obito Uchiha', quote: 'In the ninja world, those who break the rules are scum, but those who abandon their friends are worse than scum.' },
  { anime: 'One Piece', character: 'Bellemere', quote: 'No matter how hard or how painful, they never gave up.' },
  { anime: 'Naruto Shippuden', character: 'Might Guy', quote: 'Youth is not a time of life; it is a state of mind.' },
  { anime: 'One Piece', character: 'Rayleigh', quote: 'You have to live a life with no regrets.' },
  { anime: 'Naruto Shippuden', character: 'Tsunade', quote: 'People become stronger because they have memories they can’t forget.' },
  { anime: 'One Piece', character: 'Sabo', quote: 'Freedom is something that you have to actively acquire.' },
  { anime: 'Naruto Shippuden', character: 'Kisame Hoshigaki', quote: 'I am merely a shark who was fortunate enough to find his place in the world.' },
  { anime: 'One Piece', character: 'Vivi', quote: 'Miracles only happen to those who never give up.' },
  { anime: 'Naruto Shippuden', character: 'Shino Aburame', quote: 'Sometimes, questions are more important than answers.' },
  { anime: 'One Piece', character: 'Crocodile', quote: 'True losers are those who do not have the courage to stand up again.' },
  { anime: 'Naruto Shippuden', character: 'Kurenai Yuhi', quote: 'The future is not a straight line. There are many different pathways.' },
  { anime: 'One Piece', character: 'Enel', quote: 'Men who can’t wipe away the tears from a woman’s eyes aren’t real men.' },
  { anime: 'Naruto Shippuden', character: 'Asuma Sarutobi', quote: 'The king is the one who protects everyone!' },
  { anime: 'One Piece', character: 'Ivankov', quote: 'Miracles only happen to those who believe in them.' },
  { anime: 'Naruto Shippuden', character: 'Kankuro', quote: 'Art is something that blossoms for just a moment before wilting away.' },
  { anime: 'One Piece', character: 'Blackbeard', quote: 'The dreams of people will never end!' },
  { anime: 'Naruto Shippuden', character: 'Kabuto Yakushi', quote: 'The stronger the desire, the greater the darkness.' },
  { anime: 'One Piece', character: 'Aokiji', quote: 'Lazy Justice is my motto.' },
  { anime: 'Naruto Shippuden', character: 'Orochimaru', quote: 'Maybe, just maybe, there is no purpose in life… but if you linger a while longer in this world, you might discover something of value in it.' },
  { anime: 'One Piece', character: 'Akainu', quote: 'Absolute justice is the only way!' },
  { anime: 'Naruto Shippuden', character: 'Karin Uzumaki', quote: 'Love gives someone the power to break you.' },
  { anime: 'One Piece', character: 'Kuma', quote: 'Where would you like to go on a trip?' },
  { anime: 'Naruto Shippuden', character: 'Temari', quote: 'We are siblings bound by fate.' },
  { anime: 'One Piece', character: 'Whitebeard', quote: 'One piece... does exist!' },
  { anime: 'Naruto Shippuden', character: 'Ino Yamanaka', quote: 'Flowers are not just beautiful to look at, they have a language all their own.' },
  { anime: 'One Piece', character: 'Vinsmoke Sanji', quote: 'It is a man’s duty to forgive a woman’s lies.' }
];


app.use(express.static('public'));

app.get('/quote', (req, res) => {
  const randomIndex = Math.floor(Math.random() * quotes.length);
  res.send(quotes[randomIndex]);
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
