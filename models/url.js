/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('url', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    url: {
      type: DataTypes.STRING,
      allowNull: false
    },
    ID_Academia: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'academia',
        key: 'ID'
      }
    }
  }, {
    tableName: 'url',
	timeStamps: false
  });
};
