/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('cinta', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    cinta_es: {
      type: DataTypes.STRING,
      allowNull: true
    },
    cinta_en: {
      type: DataTypes.STRING,
      allowNull: true
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: false
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: false
    }
  }, {
    tableName: 'cinta'
  });
};
