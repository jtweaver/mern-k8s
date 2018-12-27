const mongoHost = process.env.NODE_ENV === 'production' ? (process.env.MONGO_URL || 'mern-k8s-mongo') : 'localhost';
const mongoPort = process.env.MONGO_PORT || 27017;
// const mongoUser = process.env.MONGO_USER || 'mernUser';
// const mongoPassword = process.env.MONGO_PASS || 'password';
const mongoDatabase = process.env.MONGO_DATABASE || 'mern';

// export const mongoURI = `mongodb://${mongoUser}:${mongoPassword}@${mongoHost}:${mongoPort}/${mongoDatabase}`;
export const mongoURI = `mongodb://${mongoHost}:${mongoPort}/${mongoDatabase}`;
export const port = process.env.PORT | 5000;
