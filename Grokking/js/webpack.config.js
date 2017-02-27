module.exports = ({ entry }) => {
  const config = {
    entry: `./lib/${entry}.js`,
    output: {
      path: __dirname + '/dist',
      filename: `${entry}.js`
    },
    node: {
      fs: 'empty'
    }
  };
  console.log(':: config ::', config);
  return config;
};
