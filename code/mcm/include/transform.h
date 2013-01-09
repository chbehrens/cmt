#ifndef TRANSFORM_H
#define TRANSFORM_H

#include "Eigen/Core"
using Eigen::ArrayXXd;

namespace MCM {
	class Transform {
		public:
			virtual ~Transform() { }

			virtual int dimIn() const = 0;
			virtual int dimOut() const = 0;

			virtual ArrayXXd operator()(const ArrayXXd& data) const = 0;
			virtual ArrayXXd inverse(const ArrayXXd& data) const = 0;
			// TODO:
//			virtual ArrayXXd logJacobian(ArrayXXd data) const = 0;
	};
}

#endif