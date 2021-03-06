import express from 'express';
import mongoose from 'mongoose';
import bodyParser from 'body-parser';
import path from 'path';
import itemsRouter from './routes/api/items';
import { mongoURI, port } from './config/keys';

const app = express();

// Bodyparser Middleware
app.use(bodyParser.json());

console.log(`Connecting to mongodb at: ${mongoURI}`);
mongoose
  .connect(mongoURI, { useNewUrlParser: true })
  .then(() => console.log('MongoDB Connected'))
  .catch((error) => console.error('MongoDB Connect Error', error));

app.use('/api/items', itemsRouter);

// Serve static assets if in production
if (process.env.NODE_ENV === 'production') {
  console.log('Running server in PRODUCTION');

  app.use(express.static('build/client'));

  app.get('*', (req, res) => {
    res.sendFile(path.resolve(__dirname, 'build', 'client', 'index.html'));
  });
} else {
  console.log('Running server in development');
}

app.listen(port, () => console.log(`Server started on port ${port}.`));
