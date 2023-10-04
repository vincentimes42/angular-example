const webpack = require('webpack');

module.exports = {
  plugins: [
    new webpack.DefinePlugin({
      $ENV: {
        backendUrl: JSON.stringify(process.env.backendUrl),
      }
    })
  ]
};