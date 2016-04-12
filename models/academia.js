/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('academia', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    nombre: {
      type: DataTypes.STRING,
      allowNull: false
    },
    descripcion_es: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    descripcion_en: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false
    },
    fechaCreacion: {
      type: DataTypes.DATE,
      allowNull: false
    },
    activa: {
      type: 'BIT(1)',
      allowNull: false,
      defaultValue: 1
    }
  }, {
    tableName: 'academia',
	timeStamps: false
  });
};
