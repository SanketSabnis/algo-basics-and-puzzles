module.exports = ({ entry }) => {
  const config = {
    entry: `./lib/${entry}.js`,
    output: {
      path: __dirname + '/dist',
      filename: `${entry}.js`
    },
    module: {
      loaders: [{
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['latest'],
          plugins: ['transform-object-rest-spread']
        }
      }]
    },
    node: {
      fs: 'empty'
    }
  };
  console.log(':: config ::', config);
  return config;
};
