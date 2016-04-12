/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('bjj_cinta', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true
    },
    cinta_es: {
      type: DataTypes.STRING,
      allowNull: false
    },
    cinta_en: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    tableName: 'bjj_cinta',
	timestamps: false
  });
};
