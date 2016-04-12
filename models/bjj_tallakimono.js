/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('bjj_tallakimono', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true
    },
    talla_es: {
      type: DataTypes.STRING,
      allowNull: false
    },
    talla_en: {
      type: DataTypes.STRING,
      allowNull: false
    },
    marca: {
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
    tableName: 'bjj_tallakimono',
	timeStamps: false
  });
};
