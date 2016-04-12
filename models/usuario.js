/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('usuario', {
    ID: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false
    },
    pass: {
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
    },
    ID_Rol: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'rol',
        key: 'ID'
      }
    }
  }, {
    tableName: 'usuario',
	timeStamps: false
  });
};
