/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('contacto_emergencias', {
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
    apellidoPaterno: {
      type: DataTypes.STRING,
      allowNull: false
    },
    apellidoMaterno: {
      type: DataTypes.STRING,
      allowNull: false
    },
    telefono: {
      type: DataTypes.INTEGER(10),
      allowNull: false
    },
    ID_Alumno: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'alumno',
        key: 'ID'
      }
    }
  }, {
    tableName: 'contacto_emergencias',
	timeStamps: false
  });
};
